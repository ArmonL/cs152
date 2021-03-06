package edu.sjsu.fwjs;

import java.util.Map;
import java.util.HashMap;

public class Environment {
    private Map<String,Value> env = new HashMap<String,Value>();
    private Environment outerEnv;

    /**
     * Constructor for global environment
     */
    public Environment() {}

    /**
     * Constructor for local environment of a function
     */
    public Environment(Environment outerEnv) {
        this.outerEnv = outerEnv;
    }

    /**
     * Handles the logic of resolving a variable.
     * If the variable name is in the current scope, it is returned.
     * Otherwise, search for the variable in the outer scope.
     * If we are at the outermost scope (AKA the global scope)
     * null is returned (similar to how JS returns undefined.
     */
    public Value resolveVar(String varName) {
        // System.out.println(" > Environment.resolveVar()");
        
        Environment e = this;

        while ((e != null) && (e.env.get(varName) == null)){
            e = e.outerEnv;
        }

        if(e == null){
            return new NullVal();
        }
        else{
            return e.env.get(varName);
        }
    }

    /**
     * Used for updating existing variables.
     * If a variable has not been defined previously in the current scope,
     * or any of the function's outer scopes, the var is stored in the global scope.
     */
    public void updateVar(String key, Value v) {
        // System.out.println(" > Environment.updateVar()");
        // System.out.println(key + ", " + v);
        // System.out.println("before: " + env.keySet());

        // Replace if exists
        if (env.containsKey(key)) {
            // System.out.println("Found key");
            env.replace(key, v);
        } else {
            // If didn't exist, replace or create in global env
            // System.out.println(key + " not in");
            // This is global view
            if (outerEnv == null)
                env.put(key, v);
            else
                outerEnv.updateVar(key, v);
        }
        // System.out.println("after: " + env.keySet());
    }

    /**
     * Creates a new variable in the local scope.
     * If the variable has been defined in the current scope previously,
     * a RuntimeException is thrown.
     */
    public void createVar(String key, Value v) {
        // System.out.println(" > Environment.createVar()");

        // Cannot redefine var
        if (env.containsKey(key))
            throw new RuntimeException("Var %s exists!%n");
        // Proceed otherwise
        env.put(key, v);

        // if (a == null)
        //     System.out.println("replaced");
        // else
        //     System.out.println("ALREADY EXISTS");
    }
}
