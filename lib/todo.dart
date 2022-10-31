/* ------------------------- What's This Page About? ------------------------ */
/// This is where I keep a ongoing conversation with myself about the project.
/// I usually keep a notion or a trello for bigger goals, but it's nice to have 
/// "what's next" immediately available with a quick ctrl + p shortcut into this
///  todo file.
/* -------------------------------------------------------------------------- */



/* ---------------------------------- TODOs --------------------------------- */

// TODO: Make the keyboard go away when textFormFields lose focus. it currently
// stays up unless you press the submit button

// TODO: Make the routine.startDateTime appear in the app calendar

// TODO: Make the routine.dayFrequency put new dots on the app calendar

// TODO: Think about having a resetDayFrequencyWhenDoneBeforeOrAfterDate.

// TODO: Calculate nextDateRoutineShouldBeDone and show it on the RoutineTile

// TODO: Implement a "I did this routine" feature that adds to 
// completedRoutineDateTimes (Probably when tapping listTile?)











/* -------------------------------- Completed ------------------------------- */
/// This is mainly nice to have as a reminder to myself of all the work I've 
/// put in, as it often times wont be very visible by just looking at commits
/// or the code itself.

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