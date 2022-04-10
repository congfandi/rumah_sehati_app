# Rumah Sehati Matindok



## Getting started

![icon](ios/Runner/Assets.xcassets/AppIcon.appiconset/120.png)

This Project created using GEX CLI with Clean Architecture and linter checker. here the project structure

-lib<br>
--domain<br>
---core<br>
----interfaces<br>
----model<br>
----network<br>
--infrastructure<br>
---base<br>
---dal<br>
---navigation<br>
---theme<br>
---utils<br>
---widget<br>
--presentation<br>
---home<br>
---login<br>
---register<br>
---screen.dart<br>
--config.dart<br>
--main.dart<br>
<br><br>
if you want to know how to use those folder, go to the google and type "Flutter Clean architecture with GETX"
<br><br>
# Installations Step

## Install Get CLI

1. https://pub.dev/packages/get<br>cli<br>
2. Read and understand it please<br>

## Create Screen
<br>
*NOTED* please do not create screen manually. Use GETX CLI<br><br>

1. get create screen:login => creating screen inside presentation folder<br>
2. get create screen:forgot_password on login => create screen on login folder<br>
3. get create:view item_loading on login => creating just view only on login folder<br>



## Crete Provider

Provider mean is connector between Controller and Network service, here the sample<br>


_get create provider:login_=> this command will create provider on model folder<br>


HIve generate model : flutter packages pub run build_runner build



# Credit
Created by Cong Fandi on 21 March 2022<br>
email 	    : me@congfandi.com<br>
website 	: https://www.thengoding.com<br>
Copyright © 2022 Cong Fandi. All rights reserved.<br>