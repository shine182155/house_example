android {
    signingConfigs {
        create("release") {
            storeFile = project.file("upload-keystore.jks")
            storePassword = "123456"
            keyAlias = "shine"
            keyPassword = "123456"
//            storeFile file("upload-keystore.jks")
//            storePassword System.getenv("KEYSTORE_PASSWORD")
//            keyAlias System.getenv("KEY_ALIAS")
//            keyPassword System.getenv("KEY_PASSWORD")
        }
    }

    namespace = "com.example.house_example"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.2.12479018"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.house_example"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}
