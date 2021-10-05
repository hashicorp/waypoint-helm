# Contributing to Waypoint Helm

>**Note:** We take Waypoint's security and our users' trust very seriously.
>If you believe you have found a security issue in Waypoint, please responsibly
>disclose by contacting us at security@hashicorp.com.

**First:** if you're unsure or afraid of _anything_, just ask or submit the
issue or pull request anyways. You won't be yelled at for giving your best
effort. The worst that can happen is that you'll be politely asked to change
something. We appreciate any sort of contributions, and don't want a wall of
rules to get in the way of that.

That said, if you want to ensure that a pull request is likely to be merged,
talk to us! A great way to do this is in issues themselves. When you want to
work on an issue, comment on it first and tell us the approach you want to take.

## Getting Started

### Some Ways to Contribute

* Report potential bugs.
* Suggest product enhancements.
* Increase our test coverage.
* Fix a [bug](https://github.com/hashicorp/waypoint-helm/labels/bug).
* Implement a requested [enhancement](https://github.com/hashicorp/waypoint-helm/labels/enhancement).
* Improve our guides and documentation.

### Reporting an Issue:

>Note: Issues on GitHub for Waypoint are intended to be related to bugs or feature requests.
>Questions should be directed to other community resources such as the [forum](https://discuss.hashicorp.com/)

* Make sure you test against the latest released version. It is possible we
already fixed the bug you're experiencing. However, if you are on an older
version of Waypoint and feel the issue is critical, do let us know.

* Check existing issues (both open and closed) to make sure it has not been
reported previously.

* Provide a reproducible test case. If a contributor can't reproduce an issue,
then it dramatically lowers the chances it'll get fixed. If we can't reproduce
an issue long enough, we are usually forced to close the issue.

* As part of the test case, please include any Waypoint configurations
(`waypoint.hcl`), build configs such as Dockerfiles, etc. Log output with
log level set with verbose flags (at least `-vv`) is helpful too.

* If the issue is related to the browser UI, please also include the name 
and version of the browser and any extensions that may be interacting 
with the UI

* Aim to respond promptly to any questions made by the Waypoint team on your
issue. Stale issues will be closed.

### Issue Lifecycle

1. The issue is reported.
1. The issue is verified and categorized by a Waypoint maintainer.
   Categorization is done via tags. For example, bugs are tagged as "bug".
1. Unless it is critical, the issue is left for a period of time (sometimes many
   weeks or months), giving outside contributors a chance to address the issue
   and our internal teams time to plan for inclusion in a release.
1. Once someone commits to addressing the issue, it is assigned to a Waypoint maintainer
   or community member who has committed to the work.
   1. If you'd like to work on an open issue, please double-check first that no
   one else is currently working on it.
   1. It's also best to give a quick overview of how you plan to solve the issue
   in a comment. That way people have a chance to inform you of any potential
   hurdles or unknown complications you may run into.
1. The issue is addressed in a pull request or commit. The issue will be
   referenced in the commit message so that the code that fixes it is clearly
   linked.
1. The issue is closed.

## Opening a PR

1. Title the PR with a helpful prefix following the pattern `parent/child`, 
e.g. `service/ui` or `bootstrap/job`
1. Include helpful information in the description
   * For a bug fix, explain or show an example of the behavior before and 
  after the change
   * If applicable, include information on how to test manually
1. Request review from either `waypoint-core` or `waypoint-frontend` based on 
your changes
