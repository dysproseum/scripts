/**
 * Reset port forwarding rules on CenturyLink C2100T router.
 *
 * Rules have problems from time to time when they disappear
 * and can't be re-added.
 *
 * Resetting them with this script is faster than calling tech support.
 */
function run(start, limit) {
  console.log(start + "(session " + sessionKey + ")");
  if (start >= limit) return;

  var curl = "http://192.168.0.1/as_advancedportforwarding.cgi?action=remove&instance=" + start + "&sessionKey=" + sessionKey + "&_=" + Math.floor(Date.now() / 1000);
  $.get(curl, function(data) {
      // Update new sessionKey value in response.
      $(".port-forwarding").html(data);
      start++;
      run(start, limit)
    }
  );
}

$("body").append('<div style="display:none" class="port-forwarding"></div>');

// Reset variable storing unavailable ports.
portused = '';

// Run with this range of instance id's.
// Add and remove a new rule in the GUI to see what its instance id was.
run(10000,15000);
