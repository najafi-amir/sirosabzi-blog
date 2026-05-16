+++
title = "{{ replace .TranslationBaseName "-" " " | title }}"
date = {{ .Date }}
description = ""
tags = []
categories = ["recipes"]
draft = true

[recipe]
yield = ""
prep_time_minutes = 0
cook_time_minutes = 0
difficulty = "moderate"
cuisine = ""
dietary = []
ingredient_count = 0
+++

## Your Story

Write your opening narrative here—the story before the recipe.

{{< recipe "recipe-name" >}}

### Ingredients
- Ingredient 1
- Ingredient 2

### Method
1. Step 1
2. Step 2

{{< /recipe >}}

## Closing Thoughts

Write any final thoughts or variations here.
