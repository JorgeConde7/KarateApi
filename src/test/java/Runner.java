import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    Karate testUsuarios() {
        return Karate.run("features/listarUsuarios").relativeTo(getClass());
    }
}
