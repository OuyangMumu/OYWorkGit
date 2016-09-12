Pod::Spec.new do |s|
  s.name         = "OYWorkGit"
  s.version      = “0.0.1”
  s.summary      = "An iOS activity indicator view."
  s.description  = <<-DESC
                    MBProgressHUD is an iOS drop-in class that displays a translucent HUD 
                    with an indicator and/or labels while work is being done in a background thread. 
                    The HUD is meant as a replacement for the undocumented, private UIKit UIProgressHUD 
                    with some additional features.
                   DESC
  s.homepage     = "https://github.com/ouyanggao/OYWorkGit.git"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { ‘ouyanggaojun’ => ‘804716454@qq.com’ }
  s.source       = { :git => "https://github.com/ouyanggao/OYWorkGit.git", :tag => s.version.to_s }
  s.ios.deployment_target = '6.0'
  s.tvos.deployment_target = '9.0'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end
