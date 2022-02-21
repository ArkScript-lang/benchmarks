public class Ackermann {
    public static int ack(int m, int n) {
        if (m > 0) {
            if (n == 0) {
                return ack(m - 1, 1);
            } else {
                return ack(m - 1, ack(m, n - 1));
            }
        } else {
            return n + 1;
        }
    }

    public static void main(String args[]) {
        long startTime = System.nanoTime() / 1000000;

        for (int i=0; i < 125; ++i) {
            ack(3, 6);
        }

        long stopTime = System.nanoTime() / 1000000;
        System.out.println("Java " + ((stopTime - startTime) / 125) + " ms");
    }
}