# What an AI wrote when asked to find the treatment with the highest expression.
#
# Produced by ChatGPT (gpt-5.6-luna, Instant mode) on 2026-09-21, from this prompt,
# with counts.csv and metadata.csv attached and nothing else said:
#
#     in R, read counts.csv and metadata.csv and tell me which treatment has
#     the highest expression
#
# The code below is what came back, unchanged except for the two file paths --
# the model was handed the files directly, so it wrote bare names rather than
# data/. Nothing else was edited.
#
# It answered in fourteen seconds, and the code ran first time. It reported:
#
#     Control has the highest overall expression.
#
#     Treatment   Mean expression
#     Control     15,326
#     OHT         14,519
#     DPN         14,296
#
# and closed with this, after the table:
#
#     One caveat: for RNA-seq, comparing raw counts this way can be misleading
#     because of library-size differences. If the goal is biological
#     differential expression, I'd normalize the counts first (e.g. DESeq2) and
#     account for variables such as patient/time.

counts <- read.csv("data/counts.csv", row.names = 1)
metadata <- read.csv("data/metadata.csv")

sample_means <- colMeans(counts)

results <- aggregate(
  sample_means ~ treatment,
  data = data.frame(
    sample_means = sample_means,
    treatment = metadata$treatment
  ),
  FUN = mean
)

results[order(-results$sample_means), ]
