# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class PyarrowAT900 < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage ""
  url "https://files.pythonhosted.org/packages/80/2e/22fb489b4be6bc5c7202b7afd4ea3e941f9b1d79c0e3f59f64be8e92160d/pyarrow-9.0.0.tar.gz"
  version "9.0.0"
  sha256 "7fb02bebc13ab55573d1ae9bb5002a6d20ba767bf8569b52fce5301d42495ab7"
  license ""
  
  depends_on "cmake" => :build
  depends_on "ccache" => :build
  depends_on "python"
  depends_on "apache-arrow@9.0.0"

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/d0/b2/fe774844d1857804cc884bba67bec38f649c99d0dc1ee7cbbf1da601357c/numpy-1.25.0.tar.gz"
    sha256 "f1accae9a28dc3cda46a91de86acf69de0d1b5f4edd44a9b0c3ceb8036dfff19"
  end

  def install
    ENV["PYARROW_BUNDLE_ARROW_CPP_HEADERS"] = "0" 
  	ENV["PYARROW_WITH_PLASMA"] = "1"  
#		ENV.append "PATH" "/opt/homebrew/bin"
		virtualenv_install_with_resources
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test pyarrow@9.0.0`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
