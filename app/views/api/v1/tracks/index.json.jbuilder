json.array! @tracks, partial: "api/v1/tracks/track", as: :track

# json.array! will take a list of queried Tracks and pass each Track into the _track.json.jbuilder partial.
# I still need to add @tracks into our controller index action.
