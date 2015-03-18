import scala.collection.immutable.HashMap
import scala.io.Source

def computeSize(list: List[String]): Int = {
  list.foldLeft(0)((total: Int,s: String) => total + s.size)

  // This way is syntactic sugar, but it's less readable IMO
  // (0 /: list)((total: Int,s: String) => total + s.size)
}

println(computeSize(List("")))
println(computeSize(List("", "lol")))
println(computeSize(List("", "loool")))
println(computeSize(List("", "lol", "lul", "lal")))

trait Censor {

  val repMap: Map[String, String]

  def repPhrase(s: String) = {
    repMap.foldLeft(s)((res: String, entry: (String,String)) => res.replaceAll(entry._1, entry._2))
  }
}

class Exp(words: Map[String, String] =  Map("Shoot" -> "Pucky", "Darn" -> "Beans")) extends Censor {
  val repMap = words
}

object Exp {
  def fromFile(filename: String): Exp = {
    val map: collection.mutable.Map[String, String] = collection.mutable.Map.empty

    val file = Source.fromFile(filename)

    val lines = file.getLines

    lines.foreach(l => {
      val entry = l.split(",")
      map += (entry(0) -> entry(1))
    })
    file.close()

    new Exp(map.toMap)
  }

}
println(new Exp().repPhrase("Shoot, my Darn head is stuck in the dumb Word3 freaking door. Holy gosh Batman!"))
println(Exp.fromFile("words.csv").repPhrase("Shoot, my Darn head is stuck in the dumb Word3 freaking door. Holy gosh Batman!"))