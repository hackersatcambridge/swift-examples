/**
 * Here we're going to scrape the /people page to get structured information about the CL staff
 */

// We use Kanna for HTML parsing
import Kanna
import Foundation

func scrapeCL() -> [CLMember] {
  // This initialiser fails only if the URL is well-formed
  // Since we know this is a well-formed URL, can force unwrap with !
  let url = URL(string: "http://www.cl.cam.ac.uk/people/")!

  var directory = [CLMember]()
  
  // Get the HTML
  guard let doc = HTML(url: url, encoding: .utf8) else { return [] }
  
  for row in doc.css(".directory tr") {

    // Check that we have the required info
    // All three of these are required
    // Notice that we can put multiple optional bindings in the `guard` statment
    guard
      let crsid = row.cssFirstMatchText(selector: ".crsid"),
      let name  = row.cssFirstMatchText(selector: ".name"),
      let room  = row.cssFirstMatchText(selector: ".room")
    else {
      // the `continue` keyword ends the current iteration of the loop
      // (i.e. immediately moves control to the next iteration of the loop if there is one)
      continue
    }


    let optionalPhone = row.cssFirstMatchText(selector: ".phone")

    // Notice that Swift has automatically given CLMember a 'member-wise' initialiser
    // that takes all CLMembers stored properties as parameters.
    // We use this here
    let member = CLMember(
      crsid: crsid,
      name: name,
      room: room,
      phone: optionalPhone
    )

    directory.append(member)
  }

  return directory
}

// The css function is defined by the Kanna package as a method on the `Searchable` type
// Here, we extend the Searchable type with new functionality
extension Searchable {
  /**
   * Returns the text of the first match of the given CSS selector if it exists
   * and is not empty or nil otherwise. Also trims whitespace.
   * - Parameter selector: The CSS selector to match against
   * - Returns: The text of the first match if such a match exists
   */
  func cssFirstMatchText(selector: String) -> String? {
    let results = self.css(selector)

    // Get the first result if there is one, otherwise return nil
    guard results.count > 0 else { return nil }
    let firstResult = results[0]

    // Check if the string is empty
    guard let text = firstResult.text else { return nil }
    let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
    return trimmedText == "" ? nil : trimmedText
  }
}

// A representation of a member of the Computer Laboratory
struct CLMember {
  let crsid: String
  let name: String
  let room: String
  // The member may or may not have a listed phone number
  // We'll make it optional
  let phone: String?
}
