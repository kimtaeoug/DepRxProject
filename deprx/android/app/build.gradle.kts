import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
    id("io.sentry.android.gradle") version "5.1.0"
    id("com.google.gms.google-services")
}

// local.properties 로드
val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.reader(Charsets.UTF_8).use { reader ->
        localProperties.load(reader)
    }
}

val flutterVersionCode = localProperties.getProperty("flutter.versionCode") ?: "1"
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

// key.properties 로드
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    FileInputStream(keystorePropertiesFile).use { stream ->
        keystoreProperties.load(stream)
    }
}

android {
    namespace = "com.turingbioinc.deprx"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    defaultConfig {
        applicationId = "com.turingbioinc.deprx"
        minSdk = 23
        targetSdk = 35
        versionCode = flutterVersionCode.toInt()
        versionName = flutterVersionName
        multiDexEnabled = true

        resValue("bool", "flutter_enable_impeller", "true")

        buildConfigField("String", "KAKAO_KEY", "\"${keystoreProperties["kakao_key"]}\"")
        buildConfigField("String", "NAVER_KEY", "\"${keystoreProperties["naver_key"]}\"")
        buildConfigField("String", "NAVER_SECRET_KEY", "\"${keystoreProperties["naver_secret_key"]}\"")
        buildConfigField("String", "NAVER_CLIENT_ID", "\"${keystoreProperties["naver_client_id"]}\"")
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = file(keystoreProperties["storeFile"] as String)
            storePassword = keystoreProperties["storePassword"] as String
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false

//            isMultiDexEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    buildFeatures {
        buildConfig = true
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("com.kakao.sdk:v2-all:2.20.6")
    implementation(platform("com.google.firebase:firebase-bom:33.14.0"))
    implementation("com.google.firebase:firebase-analytics")
    implementation("androidx.activity:activity-ktx:1.8.1")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:1.2.2")
    implementation("androidx.window:window:1.0.0")
    implementation("androidx.window:window-java:1.0.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("androidx.core:core-splashscreen:1.0.1")
    implementation("com.google.firebase:firebase-messaging-ktx")
    implementation("com.google.firebase:firebase-auth:23.2.1")
    implementation("io.sentry:sentry-android:8.2.0")
    implementation("androidx.work:work-runtime-ktx:2.9.1")
    implementation("com.orhanobut:logger:2.2.0")
    implementation("com.navercorp.nid:oauth:5.10.0")
    implementation("androidx.security:security-crypto:1.0.0")
    implementation("androidx.security:security-crypto-ktx:1.1.0-alpha06")
}