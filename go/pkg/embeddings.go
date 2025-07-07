package pkg

import (
    "math"
)

const vectorSize = 300

func GetEmbedding(text, language string) []float64 {
    seed := 0
    for _, c := range text {
        seed += int(c)
    }
    vec := make([]float64, vectorSize)
    for i := 0; i < vectorSize; i++ {
        vec[i] = math.Mod(math.Sin(float64(seed+i)), 1)
    }
    return vec
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