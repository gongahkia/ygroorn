package main

import (
    "fmt"
    "os"
    "github.com/ygroorn/ygroorn/pkg"
    "github.com/spf13/cobra"
)

func main() {
    var vibe, theme, language string
    var n int

    rootCmd := &cobra.Command{
        Use:   "ygroorn generate [description]",
        Short: "You're Gonna Run Out Of Repo Names",
        Args:  cobra.ExactArgs(1),
        Run: func(cmd *cobra.Command, args []string) {
            description := args[0]
            names := pkg.GenerateRepoNames(description, vibe, theme, language, n)
            for i, name := range names {
                fmt.Printf("%d. %s\n", i+1, name)
            }
        },
    }

    rootCmd.Flags().StringVarP(&vibe, "vibe", "v", "playful", "Vibe (playful, serious, minimal, futuristic, bold)")
    rootCmd.Flags().StringVarP(&theme, "theme", "t", "tech", "Theme (tech, art, science, business, education)")
    rootCmd.Flags().StringVarP(&language, "language", "l", "English", "Language (English, Spanish, French, German, Japanese)")
    rootCmd.Flags().IntVarP(&n, "n", "n", 5, "Number of suggestions")

    if err := rootCmd.Execute(); err != nil {
        fmt.Println(err)
        os.Exit(1)
    }
}