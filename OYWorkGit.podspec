Pod::Spec.new do |s|
  s.name         = "OYWorkGit"
  s.version      = "0.0.1"
  s.summary      = "An iOS activity indicator view."
  s.description  = <<-DESC
                    OYWorkGit is an iOS project .Personal workspace, where private working files, thank you
                   DESC
  s.homepage     = "https://github.com/ouyanggao/OYWorkGit.git"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'ouyanggaojun' => '804716454@qq.com' }
  s.source       = { :git => "https://github.com/ouyanggao/OYWorkGit.git", :tag => s.version.to_s }
  s.ios.deployment_target = '6.0'
  s.tvos.deployment_target = '9.0'
  s.source_files = 'OYWorkGit/*.{h,m}'
  s.requires_arc = true
end
