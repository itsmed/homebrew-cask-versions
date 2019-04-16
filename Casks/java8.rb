cask 'java8' do
  version '8u211,b12:478a62b7d4e34b78b671c754eaaf38ab'
  sha256 '5f43e49b9cc4444852a5c62a7d0981407a836df4684c8be8b97e7c972376c914'

  url "https://download.oracle.com/otn/java/jdk/#{version.before_comma}-#{version.after_comma.before_colon}/#{version.after_colon}/jdk-#{version.before_comma}-macosx-x64.dmg",
      cookies: {
                 'oraclelicense' => 'accept-securebackup-cookie',
               }
  name 'Oracle Java 8 Standard Edition Development Kit'
  homepage 'https://www.oracle.com/technetwork/java/javase/overview/index.html'

  depends_on macos: '>= :yosemite'

  pkg 'JDK 8 Update 202.pkg'

  uninstall pkgutil: "com.oracle.jdk#{version.before_comma}",
            delete:  [
                       '/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin',
                       '/Library/PreferencePanes/JavaControlPanel.prefPane',
                     ]

  zap trash: [
               '~/Library/Application Support/Oracle/Java',
               '~/Library/Application Support/com.oracle.java.JavaAppletPlugin.plist',
               '~/Library/Application Support/com.oracle.javadeployment.plist',
             ]

  caveats do
    license 'https://www.oracle.com/technetwork/java/javase/terms/license/javase-license.html'
  end
end
