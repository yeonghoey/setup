# install r and rstudio
brew bundle --verbose --file=<(cat <<EOF

tap 'caskroom/cask'
brew 'r'
cask 'rstudio'

EOF
)

defaults write org.R-project.R force.LANG 'en_US.UTF-8'

readonly PACKAGES=(
  '"car"'
  '"caret"'
  '"ElemStatLearn"'
  '"ISLR"'
  '"faraway"'
  '"ggplot2"'
  '"kernlab"'
  '"leaps"'
  '"lmtest"'
  '"mlbench"'
  '"rmarkdown"'
  '"rpart"'
  '"rpart.plot"'
  '"servr"'
)

readonly PKGS="c($(IFS=','; echo "${PACKAGES[*]}"))"
Rscript -e "install.packages(${PKGS}, repos = 'https://cran.rstudio.com')"


localrc 'R' << EOF
alias rmdv2='Rscript -e "servr::rmdv2()" -b'
EOF
