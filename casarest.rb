class Casarest < Formula
  desc 'The light-weight imager (lwimager) for radio astronomy'
  homepage 'https://github.com/ska-sa/meqtrees/wiki/LinkingWithCasaCore'
  url 'https://github.com/casacore/casarest/archive/refs/tags/v1.8.1.tar.gz'
  head 'https://github.com/casacore/casarest'
  env :std

  depends_on 'cmake' => :build
  depends_on 'casacore@3.5.0'
  depends_on 'boost'
  depends_on 'readline'
  depends_on 'wcslib'
  depends_on 'hdf5'
  depends_on 'gcc'

  # def patches
  #   p = []
  #   # Fixes disallowed size_t vs int* comparison, which used to be specially
  #   # included for Darwin systems, but does not seem relevant anymore (fixed in HEAD).
  #   p << 'https://gist.github.com/raw/4705907/678753a3fc04751457271c82f4a3fe39149b5819/patch1.diff' if not build.head?
  #   # Add boost_system library to avoid missing symbols (fixed in HEAD)
  #   p << 'https://gist.github.com/raw/4705907/a199623d33e3dd566a8ffe15cc0448f6e771e44d/patch2.diff' if not build.head?
  #   return p.empty? ? nil : p
  # end

  def install
    # Workaround to get fortran and C++ to play together (see Homebrew issue #20173)
#    ENV.append 'LDFLAGS', "-L/usr/lib -lstdc++"
    # Force clang to use the old standard library for now (solves issue with complex type)
#    ENV.append 'CXXFLAGS', "-stdlib=libstdc++" if ENV.compiler == :clang
		ENV.append 'CXXFLAGS', "-std=c++14"
    mkdir_p 'build'
    cd 'build'
    cmake_args = std_cmake_args
    cmake_args << "-DCASACORE_ROOT_DIR=#{HOMEBREW_PREFIX}"
    cmake_args << "-DHDF5_ROOT_DIR=#{HOMEBREW_PREFIX}"
    system 'cmake', '..', *cmake_args
    system "make install"
    mkdir_p "#{share}/casarest"
    mv '../measures_data', "#{share}/casarest/data"
  end
end
