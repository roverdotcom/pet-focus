# coding: utf-8
Pod::Spec.new do |spec|
  spec.name         = "PetFocus"
  spec.version      = "0.0.1"
  spec.summary      = "An image view that automatically centers on dogs and cats."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
                    PetFocus is an image view that automatically centers images on any pets (dogs or cats) shown in the image. It's useful when cropping photos to squares or circles. Pets don't always cooperate when they're having their photos taken, so PetFocus helps show the best part of any photo, no matter how it actually turned out.
                    DESC

  spec.homepage     = "https://github.com/roverdotcom/pet-focus"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license = {:type => "MIT", :file => "LICENSE" }
  spec.author = { "Geoff Pado" => "geoff.pado@rover.com" }

  spec.platform     = :ios, "10.0"
  spec.swift_version = "5.0"

  spec.source       = { :git => "git@github.com:roverdotcom/pet-focus.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/PetFocus", "Framework/PetFocus.h"

  # spec.framework  = "SomeFramework"
end
