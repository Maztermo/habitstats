/* ------------------------- What's This Page About? ------------------------ */
/// This is where I keep a ongoing conversation with myself about the project.
/// I usually keep a notion or a trello for bigger goals, but it's nice to have 
/// "what's next" immediately available with a quick ctrl + p shortcut into this
///  todo file.
/* -------------------------------------------------------------------------- */


/* -------------------- Postponed to offset feature creep ------------------- */
// POSTPONED: Make the routine.nextDueDateTime appear in the app calendar
// POSTPONED: Make the routine.dayFrequency put new dots on the app calendar


/* ---------------------------------- TODOs --------------------------------- */




// TODO: Think about having a resetDayFrequencyWhenDoneBeforeOrAfterDate.
// TODO: Look into improving & simplifying the Create a routine process. 
// I.e by having some fields already selected / populated. 







/* -------------------------------- Completed ------------------------------- */
/// This is mainly nice to have as a reminder to myself of all the work I've 
/// put in, as it often times wont be very visible by just looking at commits
/// or the code itself.

// DONE: Added an index for Routine model on nextDueDateTime and sorted
// based on that property in the upcoming_view. Impressed with how easy 
// it was to implement with Isar. The automatically generated functions are
// really next level. I.e. the routine.where()[.sortByNextDueDateTime()]

// DONE: Completing a routine now updates the nextDueDate based on 
// dayFrequency.

// DONE: "I did this routine" functions adds DateTime to 
// completedRoutineDateTimes.

// DONE: Made a button to test completing (updating) a routine which should
// populate routinesCompleted and also add next dueDate based on dayFrequency
// Then added the function to RoutineListTile and passed along the specific 
// routine that was tapped.

// DONE: Tested deleting from the database by adding a function in a FAB.

// DONE: Renamed routine.startDateTime to routine.nextDueDate

// DONE: Reformatting all code once while still early to have a better 
// starting point to build on.

// DONE: Extension on DateTime to show days left from todays date. Use it on
// routine tile to show how many days are left. However this calculation
// could probably be done in the NoSQL? - Make sure to have a look eventually

// DONE: Implemented a onWillPopAlert for create_routine_view to alert the
// user that draft will be deleted

// DONE: Make the keyboard go away when textFormFields lose focus. it currently
// stays up unless you press the submit button

// DONE: figure out how dayFrequency should work in the beginning
//  1 = daily
//  2 = every second day
//  3 = weekly
//  4 = bi-weekly
//  5 = monthly
// Note: being able to select individual days (mon, wed, sat) every week would
// be extra nice

// DONE: added dayFrequency, startDateTime && routineCompletedDateTimes to the 
// isar class

// DONE: extract "routines" logic into riverpod
//  - create a routineState
//  - create a routineController
//  - create a updateRoutines function

// DONE: use routineController on homeView so it auto updates after user

// DONE: creates a new routine.

// DONE: create a basic routine tileList

// DONE: make button actually save a routine

// DONE: show routine collection on the homeView

// DONE: create collection button on the bottom

// DONE: make colors when validation is ok 