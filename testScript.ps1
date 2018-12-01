Write-Output 'Get all posts' 
Invoke-RestMethod 'http://localhost:3000/posts'


Write-Output '' 
Write-Output ''
Write-Output 'Adding two new post'
Invoke-RestMethod 'http://localhost:3000/posts' -Method POST -ContentType 'Application/JSON' -Body '{"name": "Second Post!", "url": "https://microsoft.com", "text": "Microsoft corporation is a huge company indeed. We always wonder why..."}'
Invoke-RestMethod 'http://localhost:3000/posts'

Invoke-RestMethod 'http://localhost:3000/posts' -Method POST -ContentType 'Application/JSON' -Body '{"name": "Second Post!", "url": "https://microsoft.com", "text": "Microsoft corporation is a huge company indeed. We always wonder why..."}'
Invoke-RestMethod 'http://localhost:3000/posts'

Write-Output '' 
Write-Output ''
Write-Output 'Opps, third post has wrong name'
Invoke-RestMethod 'http://localhost:3000/posts/2' -Method PUT -ContentType 'Application/JSON' -Body '{"name": "Third Post!", "url": "https://microsoft.com", "text": "Microsoft corporation is a huge company indeed. We always wonder why..."}'
Write-Output ''
Write-Output 'Changes after edit'
Invoke-RestMethod 'http://localhost:3000/posts'

Write-Output '' 
Write-Output ''
Write-Output "Let's delete second post"
Invoke-RestMethod 'http://localhost:3000/posts/1' -Method DELETE
Invoke-RestMethod 'http://localhost:3000/posts'

Write-Output '' 
Write-Output ''
Write-Output "Get all comments of first post"
Invoke-RestMethod 'http://localhost:3000/posts/0/comments'

Write-Output '' 
Write-Output ''
Write-Output 'Add comments to second post'
Invoke-RestMethod 'http://localhost:3000/posts/1/comments' -Method POST -ContentType 'Application/JSON' -Body '{"text": "A third post comment"}'
Invoke-RestMethod 'http://localhost:3000/posts/1/comments' -Method POST -ContentType 'Application/JSON' -Body '{"text": "2 third post comment"}'

Write-Output '' 
Write-Output ''
Write-Output 'Modify comments in second post'
Invoke-RestMethod 'http://localhost:3000/posts/1/comments/0' -Method PUT -ContentType 'Application/JSON' -Body '{"text": "Modified Comment!"}'
Invoke-RestMethod 'http://localhost:3000/posts/1/comments'

Write-Output '' 
Write-Output ''
Write-Output 'Delete comments in second post'
Invoke-RestMethod 'http://localhost:3000/posts/1/comments/0' -Method DELETE 
Invoke-RestMethod 'http://localhost:3000/posts/1/comments'