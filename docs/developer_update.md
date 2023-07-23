# Developer update flow

_This document is intended to cover the scenario where the **rediops** 
contents change including references to OpenAPI specifications._

_This document under construction._


# End Status of flow

At the end of this flow the code has been updated with latest 
definitions.

# Reading Notes

Using code generators will break the code in many situations and
therefore using Git and diff tools will help in identifying
what has changed and perform impact analysis.

In many situations with specification changes the compiler
will pick up the changes. Some changes can only be detected
at run time if there is a high level of abstraction.
