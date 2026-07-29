import HautevilleHouse.ElectricalEngineeringPowerTransmissionCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure TransmissionLinePackage where
  lineImpedance : Type u
  surgeImpedanceLoading : Type v
  voltageProfileComputed : Prop
  thermalLimitAssessed : Prop
  lineConstantsValid : Prop

structure TransmissionLineEvidence (T : TransmissionLinePackage) where
  voltageProfileComputedClosed : T.voltageProfileComputed
  thermalLimitAssessedClosed : T.thermalLimitAssessed
  lineConstantsValidClosed : T.lineConstantsValid

def TransmissionLineClosed (T : TransmissionLinePackage) : Prop :=
  T.voltageProfileComputed ∧ T.thermalLimitAssessed ∧ T.lineConstantsValid

theorem transmission_line_closed_from_evidence (T : TransmissionLinePackage) (E : TransmissionLineEvidence T) : TransmissionLineClosed T := by
  exact And.intro E.voltageProfileComputedClosed (And.intro E.thermalLimitAssessedClosed E.lineConstantsValidClosed)

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse