package pkg

func GenerateRepoNames(description, vibe, theme, language string, n int) []string {
    profile := GetTraitProfile(vibe, theme, language)
    descVec := GetEmbedding(CleanText(description), language)
    candidates := SuggestNames(profile, language)
    type scoredName struct {
        Name  string
        Score float64
    }
    var scored []scoredName
    for _, name := range candidates {
        nameVec := GetEmbedding(name, language)
        score := CosineSimilarity(descVec, nameVec)
        scored = append(scored, scoredName{name, score})
    }
    // Sort by score descending
    sort.Slice(scored, func(i, j int) bool { return scored[i].Score > scored[j].Score })
    var result []string
    for i := 0; i < n && i < len(scored); i++ {
        result = append(result, scored[i].Name)
    }
    return result
}