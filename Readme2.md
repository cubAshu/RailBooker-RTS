Keep the old version running. Set up rolling updates with a readiness probe and maxUnavailable: 0. If the new pods don't come up healthy, the old ones just keep serving traffic and nobody sees a thing.
Roll back quickly. kubectl rollout undo deployment/<name> or helm rollback <release> <revision> gets you back to the last good version in seconds.
Let Helm do it for you. helm upgrade --atomic --timeout 5m automatically rolls back if the upgrade doesn't succeed.
Try canary or blue-green. Send 5-10% of traffic to the new version first, and only switch everyone over once it looks healthy.
Have a friendly fallback page. If you really have to take things down, show a simple "back in a few minutes" page from the ingress instead of ugly error screens.
Keep errors off the screen. Set display_errors=Off in PHP and send logs to stdout, so users never see stack traces or anything sensitive.
