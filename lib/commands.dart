/// "stack" for numbers entered and result of operations
typedef Registry = List<num>;

/// Function to undo a command
typedef UndoFunction = Registry Function(Registry);

/// Application state is a stack of numbers (registry) and stack of undo functions (history)
class State {
  final Registry registry;
  final List<UndoFunction> history;
  const State({required this.registry, required this.history});
  State.empty() : this(registry: [], history: []);
  copy({required Registry registry, required UndoFunction undo}) =>
      State(registry: registry, history: [...history, undo]);
}

/// "interface" for all commands
abstract class Command {
  /// Executing the command returns the next application state
  State execute(State state);
}

abstract class CheckedCommand extends Command {
  CheckedCommand();
  accept(Registry registry);
}

abstract class ParameterizedCommand extends CheckedCommand {
  ParameterizedCommand(String input);
}

/// Base class for arithmetic operation consuming two operants from registry
abstract class Operator extends CheckedCommand {
  Operator();
  apply(num val1, num val2);
  accept(registry) => registry.length > 1;
  execute(state) {
    final arg1 = state.registry.elementAt(state.registry.length - 2);
    final arg2 = state.registry.last;
    final result = apply(arg1, arg2);
    return state.copy(
      registry: [...state.registry.take(state.registry.length - 2), result],
      undo: (registry) => [...registry.take(registry.length - 1), arg1, arg2],
    );
  }
}

class Enter implements ParameterizedCommand {
  final num? number;
  Enter(input)
      : number = num.tryParse(input),
        super();
  accept(registry) => number != null; //Now this my boy o.o
  execute(state) => state.copy(
    registry: [...state.registry, number!],
    undo: (registry) => [...registry.take(registry.length - 1)],
  );
}

class Undo extends Command {
  execute(state) => State(
    registry: state.history.last(state.registry),
    history: [...state.history.take(state.history.length - 1)],
  );
}

class Clear extends Command {
  execute(state) => State.empty();
}

class Add extends Operator {
  Add();
  apply(val1, val2) => val1 + val2;
}

class Subtract extends Operator {
  Subtract();
  apply(val1, val2) => val1 - val2;
}

class Multiply extends Operator {
  Multiply();
  apply(val1, val2) => val1 * val2;
}

class Divide extends Operator {
  Divide();
  apply(val1, val2) => val1 / val2;
}