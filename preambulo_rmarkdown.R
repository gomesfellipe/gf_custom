# Opcoes do RMarkdown
knitr::opts_chunk$set(echo = TRUE, warning = F, fig.height = 7,
                      fig.width = 10, knitr.kable.NA = '',OutDec = ",")
options(scipen = 99999)
# Carregando pacotes
packages <- c("purrr", "dplyr", "ggplot2", "knitr", "kableExtra")
suppressMessages(purrr::walk(packages,library, character.only = TRUE, warn.conflicts = FALSE))
rm(packages)

# Funcoes customizadas do github
source("https://raw.githubusercontent.com/gomesfellipe/functions/master/inicio_e_fim_da_base.R")
source("https://raw.githubusercontent.com/gomesfellipe/functions/master/grafico_descritivo.R")

# Tema dos graficos
theme_set(theme_bw())

# Tema das tabelas
kable2 <- function(x,linhas=NULL,colunas=NULL, ...){
  k <- 
    kable(x,digits = 4,...) %>%
    kable_styling(bootstrap_options = "striped", full_width = F) %>%
    kable_styling(c("striped", "bordered"))
  
  if (!is.null(linhas)) {
    # destque na linha:
    k <-  k %>% row_spec(linhas, bold = T, color = "white", background = "#CCE2FF")
  }
  
  if (!is.null(colunas)) {
    # destque na colunas:
    k <-  k %>% column_spec(colunas,bold=T, color="white", background = "#CCE2FF")
  }
  k %>%
    scroll_box(width = "100%")
}

