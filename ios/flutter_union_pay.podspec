#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_union_pay.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_union_pay'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/laiiihz'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'laiiihz' => 'laiiihz@outlook.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.ios.framework = ['CFNetwork', 'SystemConfiguration']
  s.ios.vendored_libraries = 'Classes/libPaymentControll.a'
end
