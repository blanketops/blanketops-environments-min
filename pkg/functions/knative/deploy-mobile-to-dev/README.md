# Go HTTP Function

Welcome to your new Go Function! The boilerplate function code can be found in
[`handle.go`](handle.go). This Function responds to HTTP requests.

## Development

Develop new features by adding a test to [`handle_test.go`](handle_test.go) for
each feature, and confirm it works with `go test`.

Update the running analog of the function using the `func` CLI or client
library, and it can be invoked from your browser or from the command line:

```console
curl http://myfunction.example.com/
```

```
Typical Developer Workflow definition

Developer checks out the code
Developer creates branch for change
Developer makes changes
Developer tests and are happy with change on local
Developer commits and pushes the change to the remote repository 
```

```
Function Responsibility description 

Consume the create branch http get payload
on success 200
Get the tag,rev
Build the image
push to the registry
tekton define pipeline called here?
```
For more, see [the complete documentation]('https://github.com/knative/func/tree/main/docs')


