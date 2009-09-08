= phonenormalize


== DESCRIPTION:


== FEATURES/PROBLEMS:

   You can specify a normal_form_pattern using a pattern of %A for the
   Area Code,  %E for the Exchange, %C for the number and using the 
   !{   }  special.  This 'special' should include a %X which takes
   the place of the extension, if it exists. Everything inside the
   special (including it's own chars) gets replaced if there is no
   extension.  Everything else is untouched.  


== SYNOPSIS:


== REQUIREMENTS:

* None, just Ruby (or JRuby)

== INSTALL:

* sudo gem install phonenormalize

== LICENSE:

GPLv3

    Phonenormalize is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Phonenormalize is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Phonenormalize.  If not, see <http://www.gnu.org/licenses/>.
