Pod::Spec.new do |s|
    s.name                  = "Carousel"
    s.version               = "0.1"
    s.summary               = "Swift Image Carousel Component"
    s.description           = <<-DESC
    A shared carousel compone.
    DESC
    s.homepage              = "https://github.com/mauriciofcesteves/carouselcomponent"
    s.license               = 'MIT'
    s.author                = { "Mauricio Esteves" => "mauricio.fc.esteves@gmail.com" }
    s.source                = { :git => "https://github.com/mauriciofcesteves/carouselcomponent", :tag => s.version.to_s }##:branch => "develop" } #
    s.ios.deployment_target = '12.0'
    s.ios.frameworks        = 'UIKit', 'MapKit'
    s.ios.source_files      = 'Component/**/*.{h,m,swift}'
    s.osx.source_files      = 'Component/**/*.{h,m,swift}'
end
