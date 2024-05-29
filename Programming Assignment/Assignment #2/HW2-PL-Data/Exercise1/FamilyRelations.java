import java.util.*;

class Person {
    String name;
    boolean isMale;
    Person spouse;
    List<Person> children = new ArrayList<>();

    Person(String name, boolean isMale) {
        this.name = name;
        this.isMale = isMale;
    }

    void marry(Person spouse) {
        this.spouse = spouse;
        spouse.spouse = this;
    }

    void addChild(Person child) {
        children.add(child);
    }
}

public class FamilyRelations {
    static Map<String, Person> people = new HashMap<>();

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

        // Marriages
        marry("Bob", "Helen");
        marry("Dennis", "Pattie");
        marry("Gigi", "Martin");

        // Parent-Child relationships
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

    static void addPerson(String name, boolean isMale) {
        people.put(name, new Person(name, isMale));
    }

    static void marry(String name1, String name2) {
        Person person1 = people.get(name1);
        Person person2 = people.get(name2);
        person1.marry(person2);
    }

    static void addChild(String parentName, String childName) {
        Person parent = people.get(parentName);
        Person child = people.get(childName);
        parent.addChild(child);
        if (parent.spouse != null) {
            parent.spouse.addChild(child);
        }
    }

    static boolean areCousins(String name1, String name2) {
        Person person1 = people.get(name1);
        Person person2 = people.get(name2);
        Set<Person> cousins = new HashSet<>();
        for (Person sibling : getSiblings(person1)) {
            cousins.addAll(sibling.children);
        }
        return cousins.contains(person2);
    }

    static List<Person> getSiblings(Person person) {
        List<Person> siblings = new ArrayList<>();
        for (Person parent : people.values()) {
            if (parent.children.contains(person)) {
                siblings.addAll(parent.children);
                siblings.remove(person);
                break;
            }
        }
        return siblings;
    }

    public static void main(String[] args) {
        init();
        System.out.println("Are Liz and Rebecca cousins? " + areCousins("Liz", "Rebecca"));
    }
}
