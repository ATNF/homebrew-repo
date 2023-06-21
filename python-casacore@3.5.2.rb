# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class PythonCasacoreAT352 < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage ""
  url "https://github.com/casacore/python-casacore/archive/refs/tags/v3.5.2.tar.gz"
  version "3.5.2"
  sha256 "eb65a6903ca956dc6dd0ad1d14f17ae622c7a6b83826c6aede42428ae7314c2e"
  license ""

  depends_on "python@3.11"
  depends_on "casacore@3.5.0" => :build
  depends_on "boost-python3" => :build 

  def python3
    "python3.11"
  end

  def install
  	system python3, "setup.py", "build_ext", "-I/opt/homebrew/include",
	                                           "-L/opt/homebrew/lib"
    system python3, *Language::Python.setup_install_args(prefix, python3)
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test python-casacore@3.5.2`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
  end
end
