require 'formula'

class Audiowaveform < Formula
  desc "C++ program to generate waveform data and render waveform images from audio files"
  homepage "https://github.com/bbc/audiowaveform"
  url "https://github.com/bbc/audiowaveform/archive/1.4.2.tar.gz"
  sha256 "3fc6b995d1ae0e5bf735a76e681e3e0df85eeabc06e7f253b5e28eff2c842354"
  depends_on "cmake"
  depends_on "libmad"
  depends_on "libid3tag"
  depends_on "libsndfile"
  depends_on "gd"

  if MacOS.version < :mavericks
    depends_on "boost" => "c++11"
  else
    depends_on "boost"
  end
  # depends_on "gmock"

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DENABLE_TESTS=0"
    cmake_args << "-DCMAKE_C_COMPILER=/usr/bin/clang"
    cmake_args << "-DCMAKE_CXX_COMPILER=/usr/bin/clang++"
    cmake_args << "-DCMAKE_INSTALL_PREFIX=#{prefix}"

    mkdir "build" do
      system "cmake", "..", *cmake_args
      system "make", "install"
    end
  end

  test do
    # system "make", "test"
  end
end
