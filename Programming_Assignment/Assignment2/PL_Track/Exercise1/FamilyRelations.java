import java.util.*;

// Define a class Person to represent a person
class Person {
    String name; // The person's name
    boolean isMale; // Indicates whether the person is male
    Person spouse; // The person's spouse
    List<Person> children = new ArrayList<>(); // List of the person's children

    // Constructor for the Person class
    Person(String name, boolean isMale) {
        this.name = name;
        this.isMale = isMale;
    }

    // Method to marry another person
    void marry(Person spouse) {
        this.spouse = spouse; // Set the spouse
        spouse.spouse = this; // Set the reciprocal spouse relationship
    }

    // Method to add a child to this person's children list
    void addChild(Person child) {
        children.add(child); // Add the child to the list
    }
}

public class FamilyRelations {
    static Map<String, Person> people = new HashMap<>(); // Map to store all persons

    // Method to initialize the family data
    static void init() {
        // Adding males
        addPerson("Andy", true);
        addPerson("Bob", true);
        addPerson("Cecil", true);
        addPerson("Dennis", true);
        addPerson("Edward", true);
        addPerson("Felix", true);
        addPerson("Martin", true);
        addPerson("Oscar", true);
        addPerson("Quinn", true);
        // Adding females
        addPerson("Gigi", false);
        addPerson("Helen", false);
        addPerson("Iris", false);
        addPerson("Jane", false);
        addPerson("Kate", false);
        addPerson("Liz", false);
        addPerson("Nancy", false);
        addPerson("Pattie", false);
        addPerson("Rebecca", false);

        // Establishing marriages
        marry("Bob", "Helen");
        marry("Dennis", "Pattie");
        marry("Gigi", "Martin");

        // Establishing parent-child relationships
        addChild("Andy", "Bob");
        addChild("Bob", "Cecil");
        addChild("Cecil", "Dennis");
        addChild("Dennis", "Edward");
        addChild("Edward", "Felix");
        addChild("Gigi", "Helen");
        addChild("Helen", "Iris");
        addChild("Iris", "Jane");
        addChild("Jane", "Kate");
        addChild("Kate", "Liz");
        addChild("Martin", "Nancy");
        addChild("Nancy", "Oscar");
        addChild("Oscar", "Pattie");
        addChild("Pattie", "Quinn");
        addChild("Quinn", "Rebecca");
    }

    // Method to add a person to the map
    static void addPerson(String name, boolean isMale) {
        people.put(name, new Person(name, isMale)); // Add the person to the map
    }

    // Method to marry two persons
    static void marry(String name1, String name2) {
        Person person1 = people.get(name1); // Get the first person
        Person person2 = people.get(name2); // Get the second person
        person1.marry(person2); // Marry them
    }

    // Method to add a child to a parent
    static void addChild(String parentName, String childName) {
        Person parent = people.get(parentName); // Get the parent
        Person child = people.get(childName); // Get the child
        parent.addChild(child); // Add the child to the parent's children list
        if (parent.spouse != null) { // If the parent has a spouse
            parent.spouse.addChild(child); // Add the child to the spouse's children list
        }
    }

    // Method to determine if two persons are cousins
    static boolean areCousins(String name1, String name2) {
        Person person1 = people.get(name1); // Get the first person
        Person person2 = people.get(name2); // Get the second person
        Set<Person> cousins = new HashSet<>(); // Set to store cousins
        for (Person sibling : getSiblings(person1)) { // Get the siblings of the first person's parent
            cousins.addAll(sibling.children); // Add their children to the cousins set
        }
        return cousins.contains(person2); // Check if the second person is in the cousins set
    }

    // Method to determine if two persons are siblings
    static boolean areSiblings(String name1, String name2) {
        return getSiblings(people.get(name1)).contains(people.get(name2)); // Check if they are in the same siblings
                                                                           // list
    }

    // Method to determine if two persons are brothers
    static boolean areBrothers(String name1, String name2) {
        Person person1 = people.get(name1); // Get the first person
        Person person2 = people.get(name2); // Get the second person
        return person1.isMale && person2.isMale && areSiblings(name1, name2); // Check if both are male and siblings
    }

    // Method to determine if two persons are sisters
    static boolean areSisters(String name1, String name2) {
        Person person1 = people.get(name1);               // Get the first person
        Person person2 = people.get(name2);               // Get the second person
        return !person1.isMale && !person2.isMale && areSiblings(name1, name2); // Check if both are female and siblings
    }

    // Method to determine if one person is the parent of another
    static boolean isParent(String name1, String name2) {
        Person person1 = people.get(name1);            // Get the parent
        Person person2 = people.get(name2);            // Get the child
        return person1.children.contains(person2);     // Check if the child is in the parent's children list
    }

    // Method to get the siblings of a person
    static List<Person> getSiblings(Person person) {
        List<Person> siblings = new ArrayList<>();     // List to store siblings. is a dynamic array
        for (Person parent : people.values()) {        // Iterate through all people
            if (parent.children.contains(person)) {    // If the person is in the parent's children list
                siblings.addAll(parent.children);      // Add all children to the siblings list
                siblings.remove(person);               // Remove the person from the siblings list
                break;
            }
        }
        return siblings; // Return the siblings list
    }

    public static void main(String[] args) {
        init(); // Initialize the family data
        //System.out.println("Are Liz and Rebecca cousins? " + areCousins("Liz", "Rebecca"));
                                                                                           
        //System.out.println("Are Liz and Kate siblings? " + areSiblings("Liz", "Kate"));
                                                                                        
        //System.out.println("Are Dennis and Edward brothers? " + areBrothers("Dennis", "Edward"));
                                                                                                  
        //System.out.println("Are Helen and Iris sisters? " + areSisters("Helen", "Iris"));
                                                                                          
        //System.out.println("Is Dennis a parent of Edward? " + isParent("Dennis", "Edward"));
        System.out.println(areCousins("Rebecca", "Felix"));
                                                                                             
    }
}
