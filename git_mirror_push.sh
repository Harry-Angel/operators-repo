for i in $(seq 38 45); do
  git add mirror-workspace.zip.${i}*
  git commit -m "mirror ${i}*"
  git push
done