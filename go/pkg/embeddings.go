package pkg

import (
    "bufio"
    "math"
    "os"
    "strings"
    "strconv"
)

var Embeddings = make(map[string][]float64)

func LoadEmbeddings(path string) error {
    Embeddings = make(map[string][]float64)
    file, err := os.Open(path)
    if err != nil {
        return err
    }
    defer file.Close()
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        line := scanner.Text()
        fields := strings.Fields(line)
        if len(fields) < 2 {
            continue
        }
        word := fields[0]
        vec := make([]float64, len(fields)-1)
        for i := 1; i < len(fields); i++ {
            vec[i-1], _ = strconv.ParseFloat(fields[i], 64)
        }
        Embeddings[word] = vec
    }
    return scanner.Err()
}

func GetEmbedding(text, language string) []float64 {
    words := strings.Fields(strings.ToLower(text))
    var sum []float64
    count := 0
    for _, w := range words {
        if vec, ok := Embeddings[w]; ok {
            if sum == nil {
                sum = make([]float64, len(vec))
            }
            for i := range vec {
                sum[i] += vec[i]
            }
            count++
        }
    }
    if count == 0 && len(Embeddings) > 0 {
        for _, v := range Embeddings {
            return make([]float64, len(v))
        }
    }
    for i := range sum {
        sum[i] /= float64(count)
    }
    return sum
}

func CosineSimilarity(vec1, vec2 []float64) float64 {
    var dot, norm1, norm2 float64
    for i := range vec1 {
        dot += vec1[i] * vec2[i]
        norm1 += vec1[i] * vec1[i]
        norm2 += vec2[i] * vec2[i]
    }
    if norm1 == 0 || norm2 == 0 {
        return 0.0
    }
    return dot / (math.Sqrt(norm1) * math.Sqrt(norm2))
}