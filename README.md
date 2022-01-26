#  VenueChallenge

This app was written as a demonstration of consuming an API,
deserializing data, and outputting the results using SwiftUI.

## Summary

This app uses MVVM for state management to improve separation
of concerns. Utilizing local state would work for a small project
like this, but wouldn't scale well to larger applications.

The app contains a networking layer, models associated with the API,
SwiftUI views, and a view model to use inside the views.

## Networking 

The networking layer primarily consists of `NetworkManager`, which
contains a generic function for loading data from a `URL`. This
is used later to fetch data from the API and conveniently return
the expected data in a `Result` type, avoiding callback chains.

A `NetworkError` is returned if something goes wrong, which is
a custom `Error` enum with different error types. This enum
also conforms to `LocalizedError`, which is used in the error
message on the main view if something goes wrong.

## Models

The main models used in the app are `GuideCollection`, `Guide`,
and `Venue`. `GuideCollection` contains a collection of `Guide`s,
and each `Guide` can have an associated `Venue`. `GuideCollection`
is the model pulled back from the API.

Something to note is that the example data for this challenge
always had a present `Venue` object, but the real API data only
had an empty object. For example, this could be one `Venue`:
```json
"venue": {
    "city": "San Antonio",
    "state": "TX"
},
```

However, all API data simply had this instead:
```json
"venue": {}
``` 

To work around this, `Venue` was made optional inside `Guide`
and its properties were optional so that a missing or empty
venue in the JSON response would not break decoding. The UI
reflects this by leaving out the location if both properties
are missing; otherwise, it will include, either the one 
present property or both properties if possible.

## ViewModels

The main (and only) view model in the app is `GuideViewModel`.
This contains the necessary UI state as well as the resulting
API data. The view model has a function that asynchronously 
fetches the upcoming guides and then updates its state. 

## Views

The main view is `ContentView`, which renders `GuideListView`
when its view model is finished calling data from the API.
The `GuideListView` renders sections of `GuideCell`s that
uses a nested array of groups that split up the guides by
start date. The outer array represents the different start
dates, while the inner arrays represent guides with the
same start date.

If there is an error while loading the API, then the view 
model will update its state accordingly and present that
error message in an alert to the user. The user will then
have the option to re-try the API call.

## Improvements

A nice idea would be conforming `GuideResource` to some new 
protocol like `ApiResource` so that different resources could
be freely exchanged if their underlying type matched. This
protocol could have a required URL property and an accompanying
`fetch()` function to retrieve data from the URL. 

Improvements to the location display would also be welcome, 
since completely omitting the location when `Venue` is missing
isn't necessarily ideal. Something like "Unknown Location" 
could be better, although this could also be confusing if the
location happens to be in the title of the event.

While developing the app, the `AsyncImage` view appeared to
have an interesting glitch on both simulators and a physical
device. As soon as the view appeared, the image closest to the 
bottom of the visible view (or just barely not visible) would
sometimes not load. This doesn't appear to be due to any
code in the project, and may indicate an `AsyncImage` quirk/bug.
This could be worked around by essentially creating some other
view that is essentially `AsyncImage`, although then the 
automatic  benefits of using `AsyncImage` like automatic 
caching would be lost.

One of the biggest improvements could be the algorithm for
grouping guides by start date. The current solution uses a 
nested array so that each subarray represents a group of 
guides that have the same start date. While this solution does
work, it would ideally be refactored into a custom struct
like `GroupedGuides` where its intent is more clear than 
nested arrays. This object could have a property called 
`sections` that contains the unique, sorted start dates,
and a function that returns the sorted guides for the given
start date. This would make future maintenance much better
than a nested array and generally improve readability.
