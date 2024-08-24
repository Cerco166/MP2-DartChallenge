import 'dart:collection';

// Track Class
class Track {
  // variables for track title, performer, and length
  String name;
  String performer;
  Duration length;

  // initialize track objects
  Track(this.name, this.performer, this.length);

  // Play track method 
  void play() {
    print("Now Playing: $name by $performer");
  }

  @override
  String toString() {
    return "[$name - $performer (${length.inMinutes}m ${length.inSeconds % 60}s)]";
  }
}

// Collection Class
class Collection {
  // Declare a list to store tracks in the collection
  List<Track> tracks = [];

  // Add track to collection method
  void addTrack(Track track) {
    tracks.add(track);
  }

  // Remove track from collection by title method
  void removeTrackByTitle(String name) {
    tracks.removeWhere((track) => track.name == name);
  }

  // Play all tracks in the collection method
  void playAll() {
    for (Track track in tracks) {
      track.play();
    }
  }

  // Display all tracks in the collection with details method
  void displayCollection() {
    print("Collection:");
    for (Track track in tracks) {
      print(track);
    }
  }
}

// Festival Class
class Festival {
  // Declare a list to store collections (venues)
  List<Collection> venues = [];

  // Add collection (venue) to the festival method
  void addVenue(Collection collection) {
    venues.add(collection);
  }

  // Play a specific venue (collection) by index method
  void playVenue(int index) {
    if (index >= 0 && index < venues.length) {
      venues[index].playAll();
    } else {
      print("Invalid venue index!");
    }
  }

  // Display all venues (collections) with track details method
  void displayEventSchedule() {
    print("Festival Event Schedule:");
    int venueNumber = 1;
    for (Collection venue in venues) {
      print("Venue $venueNumber:");
      venue.displayCollection();
      print("");
      venueNumber++;
    }
  }
}

// Main function to create a festival and demonstrate functionalities
void main() {
  // Create a Festival object
  Festival festival = Festival();

  // Create some Track objects
  Track track1 = Track("One", "Metallica", Duration(minutes: 7, seconds: 45));
  Track track2 = Track("Free Bird", "Lynyrd Skynyrd", Duration(minutes: 9, seconds: 11));
  Track track3 = Track("Take the Power Back", "Rage Against the Machine", Duration(minutes: 6, seconds: 5));
  Track track4 = Track("Basket Case", "Green Day", Duration(minutes: 3, seconds: 0));
  Track track5 = Track("Smells Like Teen Spirit", "Nirvana", Duration(minutes: 5, seconds: 0));
  Track track6 = Track("Agent Orange", "Slapshock", Duration(minutes: 4, seconds: 19));
  Track track7 = Track("The Scientist", "Coldplay", Duration(minutes: 4, seconds: 26));
  Track track8 = Track("More Than Words", "Extreme", Duration(minutes: 4, seconds: 11));
  Track track9 = Track("Lose Yourself", "Eminem", Duration(minutes: 5, seconds: 20));
  Track track10 = Track("Sing for the Moment", "Eminem", Duration(minutes: 5, seconds: 26));

  // Create some Collection objects (Venues)
  Collection rockVenue = Collection();
  Collection popVenue = Collection();
  Collection rapVenue = Collection();

  // Add tracks to collections (venues)
  rockVenue.addTrack(track1);
  rockVenue.addTrack(track2);
  rockVenue.addTrack(track3);
  rockVenue.addTrack(track4);
  rockVenue.addTrack(track5);

  popVenue.addTrack(track6);
  popVenue.addTrack(track4);
  popVenue.addTrack(track5);
  popVenue.addTrack(track7);
  popVenue.addTrack(track8);
  popVenue.addTrack(track9);
  popVenue.addTrack(track10);

  rapVenue.addTrack(track1);
  rapVenue.addTrack(track3);
  rapVenue.addTrack(track5);
  rapVenue.addTrack(track4);
  rapVenue.addTrack(track9);

  // Add collections (venues) to the festival
  festival.addVenue(rockVenue);
  festival.addVenue(popVenue);
  festival.addVenue(rapVenue);

  // Display the event schedule
  festival.displayEventSchedule();

  // Play a specific venue (collection)
  print("Playing tracks from venue 3:");
  festival.playVenue(2);
}