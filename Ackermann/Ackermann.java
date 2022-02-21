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
        double startTime = (double) System.nanoTime();

        for (int i=0; i < 1000; ++i) {
            ack(3, 6);
        }

        double stopTime = (double) System.nanoTime();
        System.out.println("Java " + ((stopTime - startTime) / 1000000 / 1000) + " ms");
    }
}