import sbt._
import Keys._
import PlayProject._

object ApplicationBuild extends Build {

    val appName         = "familyleaf"
    val appVersion      = "1.0-SNAPSHOT"

    val appDependencies = Seq(
      "mysql" % "mysql-connector-java" % "5.1.19",
      "play" % "spring_2.9.1" % "2.0"
    )

    val main = PlayProject(appName, appVersion, appDependencies, mainLang = JAVA).settings(
      resolvers += "TAMU Release Repository" at "https://maven.library.tamu.edu/content/repositories/releases/"  
    )

}
