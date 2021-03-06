library(tidyverse)
library(glue)
rmd_file_list <- dir(".", pattern = "^[0-9].*Rmd$")

file_metadata <- tibble(filename = rmd_file_list,
                   raw_lines = rmd_file_list %>%
  map( ~readLines(file(.), n = 1)))

file_metadata <- file_metadata %>%
  mutate(
    title = str_extract(raw_lines, "^.*\\{#"),
    title = str_sub(title,start = 3L, end = -3L),
    link_tag = str_extract(raw_lines, "\\{#.*"),
    link_tag = str_sub(link_tag, start = 3L, -2L)
         ) %>%
  select(-raw_lines)

index_file_metadata <- tibble(filename = "index.Rmd",
                   title = "Introduction",
                   link_tag = "chapter_introduction")

cross_walk <- bind_rows(index_file_metadata, file_metadata) %>%
  mutate(chapter_no = dplyr::row_number() )

# View(cross_walk)

mdfile <- file(description = "chapter_file_title_crosswalk.md", open = "w")

cat(
  "|Ch # | Chapter Title | File Name | Link Tag|\n|----|---------------------|---------------------|---------|\n",
  file = mdfile)
md_source <- cross_walk %>%
  glue_data("|{chapter_no}|{title}|{filename}|{link_tag}|")
write_lines(md_source, mdfile, sep = "\n")
close(mdfile)
