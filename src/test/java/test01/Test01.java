package test01;

import org.nutz.lang.Files;

import java.io.File;
import java.io.IOException;

public class Test01 {


    public static void main(String[] args) {

        String a = "E:\\a";
        String b = "E:\\b";

        try {
            Files.copyDir(new File(a), new File(b));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private static void test_png() {
        String path = "C:\\Users\\Administrator\\Desktop\\新建文件夹\\";

        File[] fs = Files.lsAll(new File(path), null);

        for (int i = 0; i < fs.length; i++) {
            String filename = fs[i].getAbsolutePath();
            if (filename.endsWith("png")) {
                filename = filename.replace(".png", "");
            } else if (filename.endsWith("jpg")) {
                filename = filename.replace(".jpg", "");
            } else {
                continue;
            }
            fs[i].renameTo(new File(filename));

        }
    }


}
