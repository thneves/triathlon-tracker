json.partial! 'api/v1/tracks/track', track: @track

# json.partial! will render _track.json.builder partial, and takes
# @track as an argument. The @track is handled through the private set_track method in controller
