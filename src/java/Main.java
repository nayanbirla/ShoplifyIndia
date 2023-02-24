import java.io.*;
import java.util.*;

public class Main {
    static int n, m;
    static char[] letters;
    static List<Integer>[] adjList;
    static int[] maxCount;
    static boolean[] visited;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        // read input
        String[] parts = br.readLine().split(" ");
        n = Integer.parseInt(parts[0]);
        m = Integer.parseInt(parts[1]);
        letters = br.readLine().toCharArray();
        adjList = new List[n];
        for (int i = 0; i < n; i++) {
            adjList[i] = new ArrayList<>();
        }
        for (int i = 0; i < m; i++) {
            parts = br.readLine().split(" ");
            int u = Integer.parseInt(parts[0]) - 1;
            int v = Integer.parseInt(parts[1]) - 1;
            adjList[u].add(v);
        }

        // initialize variables
        maxCount = new int[26];
        visited = new boolean[n];
        int maxPathValue = 0;

        // find path with maximum value from each node
        for (int i = 0; i < n; i++) {
            Arrays.fill(maxCount, 0);
            dfs(i, 1);
            maxPathValue = Math.max(maxPathValue, getMaxCount());
        }

        // print result
        System.out.println(maxPathValue);
    }

    static void dfs(int u, int count) {
        visited[u] = true;
        maxCount[letters[u] - 'a'] = Math.max(maxCount[letters[u] - 'a'], count);
        for (int v : adjList[u]) {
            if (!visited[v]) {
                dfs(v, letters[v] == letters[u] ? count + 1 : 1);
            }
        }
        visited[u] = false;
    }

    static int getMaxCount() {
        int max = 0;
        for (int count : maxCount) {
            max = Math.max(max, count);
        }
        return max;
    }
}
