import HautevilleHouse.ElectricalEngineeringPowerTransmissionCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

def powerTransmissionBridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.stableOperation ∧ A.object.controlsEffective

theorem power_transmission_bridge_from_admissible_class (A : AdmissibleClass) : powerTransmissionBridgeClosed A := by
  exact A.object.conclusion

def powerTransmissionGateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem power_transmission_gate_from_admissible_class (A : AdmissibleClass) : powerTransmissionGateClosed A := by
  exact A.gateWitness

def ConstrainedPowerTransmissionClosure (A : AdmissibleClass) : Prop :=
  powerTransmissionBridgeClosed A ∧ powerTransmissionGateClosed A

theorem constrained_power_transmission_endgame (A : AdmissibleClass) : ConstrainedPowerTransmissionClosure A := by
  exact And.intro (power_transmission_bridge_from_admissible_class A) (power_transmission_gate_from_admissible_class A)

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse