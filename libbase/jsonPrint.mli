(*
    Copyright © 2011 MLstate

    This file is part of OPA.

    OPA is free software: you can redistribute it and/or modify it under the
    terms of the GNU Affero General Public License, version 3, as published by
    the Free Software Foundation.

    OPA is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
    more details.

    You should have received a copy of the GNU Affero General Public License
    along with OPA. If not, see <http://www.gnu.org/licenses/>.
*)
(**
   Printer of Json structure

   @author Rudy Sicard
   @author Raja Boujbel
   @author Mathieu Barbin
*)

(**
   Escape some special character.
*)
val escape_non_utf8_special : string -> string

module type Printer =
sig
  type t
  val json : t -> JsonTypes.json -> unit
end

(** {6 Efficient printing} *)

(**
   Factory
*)
val print : ('output -> string -> unit) -> 'output -> JsonTypes.json -> unit

(**
   This printer is used whenever you do not care about the look of the printed code.
   It's main quality reside in the fact that it prints directly in an [output_channel],
   without neither with parsing some format.
*)

module Output : Printer with type t = out_channel

(** {6 Unformated printing, with Buffer interface} *)

module Buffer : Printer with type t = Buffer.t


(** {6 Unefficient printing} *)

(**
   Do not use for big structure
*)
val to_string : JsonTypes.json -> string
