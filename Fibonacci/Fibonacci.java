public class Fibonacci {
    public static int fibo(int n) {
        if (n < 2) {
            return n;
        } else {
            return fibo(n - 1) + fibo(n - 2);
        }
    }

    public static void main(String args[]) {
        long startTime = System.nanoTime() / 1000000;

        for (int i=0; i < 125; ++i) {
            fibo(28);
        }

        long stopTime = System.nanoTime() / 1000000;
        System.out.println("Java " + ((stopTime - startTime) / 125) + " ms");
    }
}