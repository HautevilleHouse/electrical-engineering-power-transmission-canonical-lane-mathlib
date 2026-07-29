import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.transientStabilityHeld ∧ A.object.voltageStabilityHeld

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse