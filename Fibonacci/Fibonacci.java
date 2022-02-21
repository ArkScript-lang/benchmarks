public class Fibonacci {
    public static int fibo(int n) {
        if (n < 2) {
            return n;
        } else {
            return fibo(n - 1) + fibo(n - 2);
        }
    }

    public static void main(String args[]) {
        double startTime = (double) System.nanoTime();

        for (int i=0; i < 1000; ++i) {
            fibo(28);
        }

        double stopTime = (double) System.nanoTime();
        System.out.println("Java " + ((stopTime - startTime) / 1000000 / 1000) + " ms");
    }
}