val kotlinVersion = "2.0.20"

buildscript {
    repositories {
        google()
        mavenCentral()
        maven("https://jitpack.io")
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.3.1")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:2.0.20")
        classpath("com.google.gms:google-services:4.4.2")
    }
}
plugins{
    id("com.google.gms.google-services") version "4.4.2" apply false
}

// 모든 프로젝트에 적용할 저장소 설정
allprojects {
    repositories {
        google()
        mavenCentral()
        maven("https://devrepo.kakao.com/nexus/content/groups/public/")
    }
}

// 빌드 디렉토리 설정
rootProject.buildDir = File("../build")
subprojects {
    buildDir = File(rootProject.buildDir, name)
    evaluationDependsOn(":app")
}

// clean 태스크 정의
tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}