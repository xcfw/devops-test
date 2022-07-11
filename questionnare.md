## 1. What does this script do?

```bash
#!/bin/bash
# /home/user/dev/devops-test/.husky/ruby.sh

echo "Running ruby standard rb check"

rubyfiles=$(git diff --cached --name-only --diff-filter=ACM "app/*.rb" | tr '\n' ' ')

[ -z "$rubyfiles" ] && exit 0

echo $rubyfiles | tr '\n' ' '

echo '\n'

echo $rubyfiles | xargs bundle exec standardrb --format worst --out ".husky/pre-commit-check.tmp"

sed -i '' '/--/d; $d' ".husky/pre-commit-check.tmp"

notes=$(.husky/check_errors_count.rb ".husky/pre-commit-check.tmp" $rubyfiles)

rm -f .husky/pre-commit-check.tmp

[ -n "$notes" ] && echo $notes && exit 1;

git add .husky/total_rb_errors/errors.json

exit 0
```

<details><summary>## 2. Click here to open second question</summary>
<p>

## Is this script cross-platform?
## And if not why it might fail and what operating systems this script is incompatible with?

</p>
</details>

<details><summary>## 3. Click here to open third question</summary>
<p>

3. How to make this script work both on macOS and Linux

</p>
</details>

