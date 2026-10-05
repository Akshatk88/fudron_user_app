allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()

rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory =
        newBuildDir.dir(project.name)

    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    afterEvaluate {
        project.extensions
            .findByType<com.android.build.gradle.BaseExtension>()
            ?.let { androidExtension ->

                androidExtension.compileSdkVersion(36)

                androidExtension.compileOptions {
                    sourceCompatibility = JavaVersion.VERSION_21
                    targetCompatibility = JavaVersion.VERSION_21
                }
            }

        project.extensions
            .findByType<org.jetbrains.kotlin.gradle.dsl.KotlinAndroidProjectExtension>()
            ?.let { kotlinExtension ->
                kotlinExtension.jvmToolchain(21)

                kotlinExtension.compilerOptions {
                    jvmTarget.set(
                        org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_21
                    )
                }
            }
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}